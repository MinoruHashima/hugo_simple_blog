/**
 * 言語自動判別 + 手動切り替え機能
 *
 * 仕組み:
 * 1. localStorage に言語設定があれば、それを使う（手動選択を尊重）
 * 2. なければブラウザ言語を判定してリダイレクト
 * 3. 言語切り替えリンククリック時に localStorage を更新
 */

(function() {
  'use strict';

  var STORAGE_KEY = 'preferred-language';
  var SUPPORTED_LANGUAGES = ['ja', 'en'];
  var DEFAULT_LANGUAGE = 'ja';

  /**
   * 現在のページの言語を取得
   */
  function getCurrentLanguage() {
    var path = window.location.pathname;
    for (var i = 0; i < SUPPORTED_LANGUAGES.length; i++) {
      var lang = SUPPORTED_LANGUAGES[i];
      if (lang !== DEFAULT_LANGUAGE && path.startsWith('/' + lang + '/')) {
        return lang;
      }
    }
    return DEFAULT_LANGUAGE;
  }

  /**
   * ブラウザの言語設定を取得（対応言語のみ）
   */
  function getBrowserLanguage() {
    var browserLang = navigator.language || navigator.userLanguage;
    if (!browserLang) return null;

    // 完全一致チェック（例: ja, en）
    var langCode = browserLang.toLowerCase().split('-')[0];
    if (SUPPORTED_LANGUAGES.indexOf(langCode) !== -1) {
      return langCode;
    }
    return null;
  }

  /**
   * 保存された言語設定を取得
   */
  function getSavedLanguage() {
    try {
      return localStorage.getItem(STORAGE_KEY);
    } catch (e) {
      return null;
    }
  }

  /**
   * 言語設定を保存
   */
  function saveLanguage(lang) {
    try {
      localStorage.setItem(STORAGE_KEY, lang);
    } catch (e) {
      // localStorage が使えない環境では無視
    }
  }

  /**
   * 言語に応じたURLを生成
   */
  function getLanguageUrl(targetLang) {
    var path = window.location.pathname;
    var currentLang = getCurrentLanguage();

    // 現在の言語プレフィックスを除去
    if (currentLang !== DEFAULT_LANGUAGE) {
      path = path.replace(new RegExp('^/' + currentLang + '/'), '/');
    }

    // 新しい言語プレフィックスを追加
    if (targetLang !== DEFAULT_LANGUAGE) {
      path = '/' + targetLang + path;
    }

    return path;
  }

  /**
   * 初回アクセス時のリダイレクト処理
   */
  function handleInitialRedirect() {
    var savedLang = getSavedLanguage();
    var currentLang = getCurrentLanguage();

    // 保存された言語がある場合、それを優先
    if (savedLang && savedLang !== currentLang) {
      window.location.href = getLanguageUrl(savedLang);
      return;
    }

    // 保存がなければブラウザ言語を確認
    if (!savedLang) {
      var browserLang = getBrowserLanguage();
      if (browserLang && browserLang !== currentLang) {
        saveLanguage(browserLang);
        window.location.href = getLanguageUrl(browserLang);
        return;
      }
      // リダイレクトしない場合も現在の言語を保存
      saveLanguage(currentLang);
    }
  }

  /**
   * 言語切り替えリンクにイベントを設定
   */
  function setupLanguageSwitcher() {
    document.addEventListener('click', function(e) {
      var target = e.target.closest('[data-lang]');
      if (target) {
        var lang = target.getAttribute('data-lang');
        saveLanguage(lang);
        // リンクのhrefでページ遷移するので、明示的なリダイレクトは不要
      }
    });
  }

  // 初期化
  document.addEventListener('DOMContentLoaded', function() {
    setupLanguageSwitcher();
  });

  // 初回リダイレクト（DOMContentLoaded前に実行）
  handleInitialRedirect();

})();

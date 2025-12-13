const fs = require('fs');
const path = require('path');

// Markdownファイルを読み込んでJSON化する関数
function mdFileToJson(filePath) {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n');

  let json = {};
  let currentSection = null;

  for (let line of lines) {
    line = line.trim();
    if (line.startsWith('#')) continue; // タイトル行は無視
    if (line.startsWith('##')) {
      currentSection = line.replace('##', '').trim();
      json[currentSection] = [];
      continue;
    }
    if (line.startsWith('- ')) {
      json[currentSection].push(line.replace('- ', '').trim());
    } else if (line && currentSection) {
      json[currentSection].push(line);
    }
  }

  return json;
}

// ファイルごとに変換
const files = ['project_context.md', 'progress_summary.md', 'design_summary.md', 'coding_summary.md'];
const contextDir = path.join(__dirname, '../context');

let projectJson = {};

files.forEach(file => {
  const filePath = path.join(contextDir, file);
  const key = path.basename(file, '.md'); // ファイル名をキーに
  projectJson[key] = mdFileToJson(filePath);
});

// JSONとして出力
fs.writeFileSync(path.join(contextDir, 'project_context.json'), JSON.stringify(projectJson, null, 2));

console.log('✅ MarkdownをJSONに変換しました！');

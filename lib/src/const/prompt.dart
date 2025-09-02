String getPrompt(String content){
  return """
以下に示すテキストを日本語(ja_jp.json)に翻訳してください。

以下の注意事項を必ず順守してください。:
- 出力にはjson形式でコードブロックで出力してください。
- コメント文は含まないでください。
- 固有名詞だと思われるものにはカタカナで翻訳してください。
- MOD名（item_group）は翻訳してないでください。
- アイテム名やブロック名はマインクラフトのアイテム名に似たものがある場合、それの命名ルールに従ってください。(シャベルなど)

命名ルール:
- fence: 柵

命名ルール(mekanism系):
- basic: 基本
- advanced: 発展
- elite: 精鋭
- ultimate: 究極

以下、en_us.json
$content
""";
}

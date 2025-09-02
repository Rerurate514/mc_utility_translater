import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/explain_edit_text.dart';
import 'package:mc_utility_translater/src/components/extract_zip_button.dart';
import 'package:mc_utility_translater/src/components/extract_zip_result.dart';
import 'package:mc_utility_translater/src/components/file_deleter_button.dart';
import 'package:mc_utility_translater/src/components/file_deleter_result.dart';
import 'package:mc_utility_translater/src/components/file_loader_button.dart';
import 'package:mc_utility_translater/src/components/file_loader_result.dart';
import 'package:mc_utility_translater/src/components/file_pick_button.dart';
import 'package:mc_utility_translater/src/components/file_pick_result.dart';
import 'package:mc_utility_translater/src/components/file_saver_button.dart';
import 'package:mc_utility_translater/src/components/file_saver_result.dart';
import 'package:mc_utility_translater/src/components/json_editor.dart';
import 'package:mc_utility_translater/src/components/next_under_arrow_icon.dart';
import 'package:mc_utility_translater/src/components/page_wrapper.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FilePickButton(),
                    const SizedBox(width: 8),
                    const Expanded(child: FilePickResult()),
                  ],
                ),
                Center(child: NextUnderArrowIcon(),),
                Row(
                  children: [
                    const ExtractZipButton(),
                    const SizedBox(width: 8),
                    const Expanded(child: ExtractZipResult()),
                  ],
                ),
                Center(child: NextUnderArrowIcon(),),
                Row(
                  children: [
                    const FileLoaderButton(),
                    const SizedBox(width: 8),
                    const Expanded(child: FileLoaderResult()),
                  ],
                ),
                Center(child: NextUnderArrowIcon(),),
                Center(child: ExplainEditText(),),
                Center(child: NextUnderArrowIcon(),),
                Row(
                  children: [
                    const FileSaverButton(),
                    const SizedBox(width: 8),
                    const Expanded(child: FileSaverResult()),
                  ],
                ),
                Center(child: NextUnderArrowIcon(),),
                Row(
                  children: [
                    const FileDeleterButton(),
                    const SizedBox(width: 8),
                    const Expanded(child: FileDeleterResult()),
                  ],
                ),
                Center(child: NextUnderArrowIcon(),),
                Center(child: Text("リソースパックとしてZipファイルに圧縮（ボタン付）"),),
                Center(child: NextUnderArrowIcon(),),
                Center(child: Text("完成（エクスプローラーを開くボタンを用意する）"),),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 2,
            child: Column(
              children: const [
                Expanded(child: JsonEditor()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

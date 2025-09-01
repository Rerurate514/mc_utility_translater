
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/extract_zip_button.dart';
import 'package:mc_utility_translater/src/components/extract_zip_result.dart';
import 'package:mc_utility_translater/src/components/file_loader_button.dart';
import 'package:mc_utility_translater/src/components/file_loader_result.dart';
import 'package:mc_utility_translater/src/components/file_pick_button.dart';
import 'package:mc_utility_translater/src/components/file_pick_result.dart';
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
              children: [
                Row(
                  children: [
                    FilePickButton(),
                    FilePickResult()
                  ],
                ),
                Row(
                  children: [
                    ExtractZipButton(),
                    ExtractZipResult()
                  ],
                ),
                Row(
                  children: [
                    FileLoaderButton(),
                    FileLoaderResult()
                  ],
                )
              ]
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Text("data")
              ]
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/notifier/extract_zip_notifier.dart';


class ExtractZipButton extends ConsumerStatefulWidget {
  const ExtractZipButton({super.key});

  @override
  ConsumerState<ExtractZipButton> createState() => _ExtractZipButtonState();
}

class _ExtractZipButtonState extends ConsumerState<ExtractZipButton> {
  @override
  Widget build(BuildContext context) {
    return CommonButton(      
      onPressed: () {
        ref.read(extractZipNotifierProvider.notifier).extractZip();
      }, 
      icon: Icons.folder_zip,
      text: 'ファイルを解凍',
    );
  }
}

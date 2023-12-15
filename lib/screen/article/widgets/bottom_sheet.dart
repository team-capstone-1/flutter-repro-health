import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/theme/theme.dart';

class BottomSheetContent extends StatefulWidget {
  final List<bool> selectedItem;
  final StateSetter setState;
  final VoidCallback onDelete;

  const BottomSheetContent({
    Key? key,
    required this.selectedItem,
    required this.setState,
    required this.onDelete,
  }) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    List<int> selectedIndex = [];
    for (int i = 0; i < widget.selectedItem.length; i++) {
      if (widget.selectedItem[i]) {
        selectedIndex.add(i);
      }
    }

    return SizedBox(
      height: 174,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedIndex.isEmpty
                  ? const Text('Tidak ada artikel')
                  : Text('${selectedIndex.length} Artikel dipilih'),
              const SizedBox(
                height: 8,
              ),
              ButtonComponent(
                labelText: Center(
                  child: Text(
                    'Hapus',
                    style: semiBold12Grey10,
                  ),
                ),
                backgroundColor: selectedIndex.isEmpty ? grey200 : negative,
                onPressed: selectedIndex.isEmpty ? () {} : widget.onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

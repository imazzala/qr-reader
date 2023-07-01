import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String type;
  const ScanTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scan = scanListProvider.scans;

    return ListView.builder(
        itemCount: scan.length,
        itemBuilder: ((context, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                scanListProvider.deleteScanById(scan[index].id!);
              },
              child: ListTile(
                leading: Icon(type == 'http' ? Icons.html : Icons.map,
                    color: Theme.of(context).primaryColor),
                title: Text(scan[index].value),
                subtitle: Text(scan[index].id.toString()),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: (() => launchUrlQR(context, scan[index])),
              ),
            )));
  }
}

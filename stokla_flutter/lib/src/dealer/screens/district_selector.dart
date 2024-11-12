import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class DistrictData {
  final String kodu;
  final String ilKodu;
  final String ad;
  final String ilAdi;

  DistrictData({
    required this.kodu,
    required this.ilKodu,
    required this.ad,
    required this.ilAdi,
  });
}

class DeliveryAreaSelector {
  List<DistrictData> _data = [];
  List<String> _districts = [];

  DeliveryAreaSelector() {
    _loadCSV();
  }

  Future<void> _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/districts.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter(fieldDelimiter: ';').convert(rawData);

    _data = listData.skip(1).map((row) {
      return DistrictData(
        kodu: row[0].toString(),
        ilKodu: row[1].toString(),
        ad: row[2].toString(),
        ilAdi: row[3].toString(),
      );
    }).toList();

    Set<String> uniqueDistricts = _data.map((e) => e.ilAdi).toSet();
    List<String> priorityOrder = ['MUĞLA', 'İZMİR', 'İSTANBUL', 'ANKARA'];
    _districts = [
      ...priorityOrder.where((district) => uniqueDistricts.contains(district)),
      ...uniqueDistricts.difference(priorityOrder.toSet()).toList()..sort()
    ];
  }

  Future<String?> showDistrictDialog(BuildContext context) async {
    await _loadCSV(); // Ensure data is loaded
    if (context.mounted) {
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select a District'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: _districts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_districts[index]),
                    onTap: () {
                      Navigator.of(context).pop(_districts[index]);
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return null;
    }
  }

  Future<List<String>?> showLocalitiesDialog(
      BuildContext context, String district,
      {bool singleSelection = false}) async {
    List<String> localities = _data
        .where((d) => d.ilAdi == district)
        .map((d) => d.ad)
        .toList()
      ..sort();

    return showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        List<String> selectedLocalities = [];
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                  'Select ${singleSelection ? "a Locality" : "Localities"} for $district'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: localities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final locality = localities[index];
                    return singleSelection
                        ? RadioListTile<String>(
                            title: Text(locality),
                            value: locality,
                            groupValue: selectedLocalities.isNotEmpty
                                ? selectedLocalities.first
                                : null,
                            onChanged: (String? value) {
                              setState(() {
                                selectedLocalities =
                                    value != null ? [value] : [];
                              });
                            },
                          )
                        : CheckboxListTile(
                            title: Text(locality),
                            value: selectedLocalities.contains(locality),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedLocalities.add(locality);
                                } else {
                                  selectedLocalities.remove(locality);
                                }
                              });
                            },
                          );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    Navigator.of(context).pop(selectedLocalities);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<int> getAreaIds(String district, List<String> localities) {
    return _data
        .where((d) => d.ilAdi == district && localities.contains(d.ad))
        .map((d) => int.parse(d.kodu))
        .toList();
  }

  //takes a district code (KODU) and returns the corresponding city code (IL_KODU).
  String? getCityCode(String districtCode) {
    final district = _data.firstWhere(
      (d) => d.kodu == districtCode,
      orElse: () => DistrictData(kodu: '', ilKodu: '', ad: '', ilAdi: ''),
    );
    return district.ilKodu.isNotEmpty ? district.ilKodu : null;
  }

  // New method to get district code from district name
  String? getDistrictCode(String districtName) {
    final district = _data.firstWhere(
      (d) => d.ad == districtName,
      orElse: () => DistrictData(kodu: '', ilKodu: '', ad: '', ilAdi: ''),
    );
    return district.kodu.isNotEmpty ? district.kodu : null;
  }

  // New method to get city name from city code
  String? getCityName(String cityCode) {
    final district = _data.firstWhere(
      (d) => d.ilKodu == cityCode,
      orElse: () => DistrictData(kodu: '', ilKodu: '', ad: '', ilAdi: ''),
    );
    return district.ilAdi.isNotEmpty ? district.ilAdi : null;
  }
}

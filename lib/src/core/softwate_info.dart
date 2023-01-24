import 'package:ble_ota_app/src/core/version.dart';
import 'package:meta/meta.dart';

@immutable
class SoftwareInfo {
  const SoftwareInfo({
    this.name = "",
    this.ver = const Version(),
    this.path = "",
    this.icon,
    this.hwName = "",
    this.hwVer,
    this.minHwVer,
    this.maxHwVer,
  });

  static SoftwareInfo fromJson(json) => SoftwareInfo(
        name: json["software_name"],
        ver: Version.fromList(json["software_version"]),
        path: json["software_path"],
        icon: json["software_icon"],
        hwName: json["hardware_name"],
        hwVer: _getOptionalVersion(json, "hardware_version"),
        minHwVer: _getOptionalVersion(json, "min_hardware_version"),
        maxHwVer: _getOptionalVersion(json, "max_hardware_version"),
      );

  static _getOptionalVersion(json, key) =>
      json.containsKey(key) ? Version.fromList(json[key]) : null;

  final String name;
  final Version ver;
  final String path;
  final String? icon;
  final String hwName;
  final Version? hwVer;
  final Version? minHwVer;
  final Version? maxHwVer;
}

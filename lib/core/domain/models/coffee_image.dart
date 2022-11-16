import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_image.freezed.dart';
part 'coffee_image.g.dart';

@freezed
class CoffeeImage with _$CoffeeImage {
  @JsonSerializable(explicitToJson: true)
  const factory CoffeeImage({
    @JsonKey(name: 'file') required String url,
  }) = _CoffeeImage;

  factory CoffeeImage.fromJson(Map<String, dynamic> json) =>
      _$CoffeeImageFromJson(json);
}

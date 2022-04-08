import 'package:equatable/equatable.dart';

class Countries extends Equatable {
  const Countries({
    required this.commonName,
    required this.officialName,
  });

  final String commonName;
  final String officialName;

  @override
  List<Object?> get props => [officialName];
}

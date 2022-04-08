import 'package:equatable/equatable.dart';

class Countries extends Equatable {
  const Countries({
    required this.commonName,
    required this.officialName,
    required this.isSelected,
  });

  final String? commonName;
  final String? officialName;
  final bool isSelected;

  @override
  List<Object?> get props => [officialName];
}

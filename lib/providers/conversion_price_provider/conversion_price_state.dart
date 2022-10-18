import 'package:crypto_mob_app/models/models.dart';

enum ConversionPriceStatus{
  initial,
  isLoading,
  isLoaded,
  error;
}

class ConversionPriceState {
  ConversionPriceStatus conversionPriceStatus;
  CustomError? error;

//<editor-fold desc="Data Methods">

  ConversionPriceState({
    required this.conversionPriceStatus,
    this.error,
  });

  ConversionPriceState copyWith({
    ConversionPriceStatus? conversionPriceStatus,
    CustomError? error,
  }) {
    return ConversionPriceState(
      conversionPriceStatus:
          conversionPriceStatus ?? this.conversionPriceStatus,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'conversionPriceStatus': this.conversionPriceStatus,
      'error': this.error,
    };
  }

  factory ConversionPriceState.initial() {
    return ConversionPriceState(
      conversionPriceStatus: ConversionPriceStatus.initial,
    );
  }

//</editor-fold>
}
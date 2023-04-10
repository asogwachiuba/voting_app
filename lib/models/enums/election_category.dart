enum ELECTIONCATEGORY {
  presidential,
  gubernatorial,
  localGovernment,
}

extension DateTimeX on DateTime {
  bool isUnderage() =>
      (DateTime(DateTime.now().year, this.month, this.day)
              .isAfter(DateTime.now())
          ? DateTime.now().year - this.year - 1
          : DateTime.now().year - this.year) <
      18;
}

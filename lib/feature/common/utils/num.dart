extension NumUtils on num {
  num toPositive() => this < 0 ? 0 : this;
}

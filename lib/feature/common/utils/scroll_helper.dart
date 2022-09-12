import 'dart:async';

import 'package:flutter/material.dart';

class ScrollHelper {
  ScrollController scrollController;
  ScrollHelper(
    this.scrollController,
  );

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 400)).then(
      (value) => scrollController.jumpTo(
        scrollController.position.maxScrollExtent,
      ),
    );
  }
}

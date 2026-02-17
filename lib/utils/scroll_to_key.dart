import 'package:flutter/widgets.dart';

Future<void> scrollToKey({
  required GlobalKey key,
  required ScrollController controller,
  required Duration duration,
  Curve curve = Curves.easeInOutCubic,
  double topPadding = 16,
}) async {
  final ctx = key.currentContext;
  if (ctx == null) return;

  final box = ctx.findRenderObject() as RenderBox?;
  if (box == null) return;

  final pos = box.localToGlobal(Offset.zero);
  final offset = controller.offset + pos.dy - topPadding;

  await controller.animateTo(
    offset.clamp(0.0, controller.position.maxScrollExtent),
    duration: duration,
    curve: curve,
  );
}

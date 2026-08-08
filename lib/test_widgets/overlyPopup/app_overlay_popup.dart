import 'package:flutter/material.dart';

class AppOverlayPopup extends StatefulWidget {
  final Widget trigger;

  final Widget Function(BuildContext context, VoidCallback close) popupBuilder;
  final Alignment targetAnchor;
  final Alignment followerAnchor;
  final Offset offset;


  const AppOverlayPopup({
    super.key,
    required this.trigger,
    required this.popupBuilder,
    this.targetAnchor = Alignment.bottomRight,
    this.followerAnchor = Alignment.topRight,
    this.offset = const Offset(0, 8)});

  @override
  State<AppOverlayPopup> createState() => _AppOverlayPopupState();
}

class _AppOverlayPopupState extends State<AppOverlayPopup> {
  final OverlayPortalController _controller = OverlayPortalController();
  final LayerLink _layerLink = LayerLink();


  void _toggle() {
    _controller.toggle();
  }

  void _close() {
    _controller.hide();
  }


  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _controller,

      overlayChildBuilder: 
(context) {
  return UnconstrainedBox(
    alignment: Alignment.topLeft,

    child: CompositedTransformFollower(
      link: _layerLink,

      targetAnchor: widget.targetAnchor,
      followerAnchor: widget.followerAnchor,

      offset: widget.offset,

      showWhenUnlinked: false,

      child: widget.popupBuilder(
        context,
        _close,
      ),
    ),
  );
},



       child: CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: _toggle,
              child: widget.trigger,
            )
            )
    );
  }
}
import 'package:flutter/material.dart';

class TapEffect extends StatefulWidget {
  const TapEffect({
    Key? key,
    this.isClickable = true,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final bool isClickable;
  final VoidCallback? onTap;
  final Widget child;

  @override
  _TapEffectState createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _isTapInProgress = false; // Track if a tap is in progress

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animationController.animateTo(1.0,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (_isTapInProgress || !widget.isClickable) return;

    // Set tap in progress
    setState(() {
      _isTapInProgress = true;
    });

    try {
      // Trigger the tap action if provided
      if (widget.onTap != null) {
        widget.onTap!();
      }
    } finally {
      // Release the tap after completion
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        _isTapInProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.isClickable && !_isTapInProgress) {
          // Handle tap only if clickable and no other tap in progress
          await _handleTap();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (widget.isClickable && !_isTapInProgress) {
          // Start animation on tap down
          animationController.animateTo(0.9,
              duration: const Duration(milliseconds: 120),
              curve: Curves.fastOutSlowIn);
        }
      },
      onTapUp: (TapUpDetails details) {
        if (widget.isClickable && !_isTapInProgress) {
          // Reset animation on tap up
          animationController.animateTo(1.0,
              duration: const Duration(milliseconds: 240),
              curve: Curves.fastOutSlowIn);
        }
      },
      onTapCancel: () {
        if (widget.isClickable && !_isTapInProgress) {
          // Reset animation if the tap is canceled
          animationController.animateTo(1.0,
              duration: const Duration(milliseconds: 240),
              curve: Curves.fastOutSlowIn);
        }
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: animationController.value,
            origin: const Offset(0.0, 0.0),
            child: widget.child,
          );
        },
      ),
    );
  }
}

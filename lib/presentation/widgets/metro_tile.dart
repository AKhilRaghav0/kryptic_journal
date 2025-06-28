import 'package:flutter/material.dart';

enum LiveTileSize {
  small, // 1x1 - 150x150
  wide, // 2x1 - 310x150
  large, // 2x2 - 310x310
}

class LiveTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? count;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final LiveTileSize size;
  final VoidCallback? onTap;
  final Widget? child;

  const LiveTile({
    super.key,
    required this.title,
    this.subtitle,
    this.count,
    this.icon,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.size = LiveTileSize.small,
    this.onTap,
    this.child,
  });

  @override
  State<LiveTile> createState() => _LiveTileState();
}

class _LiveTileState extends State<LiveTile> {
  bool _isPressed = false;

  double get _tileWidth {
    switch (widget.size) {
      case LiveTileSize.small:
        return 150;
      case LiveTileSize.wide:
        return 310;
      case LiveTileSize.large:
        return 310;
    }
  }

  double get _tileHeight {
    switch (widget.size) {
      case LiveTileSize.small:
        return 150;
      case LiveTileSize.wide:
        return 150;
      case LiveTileSize.large:
        return 310;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: _tileWidth,
        height: _tileHeight,
        margin: const EdgeInsets.all(5),
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          // No border radius - authentic Windows Phone tiles are square
        ),
        child:
            widget.child ??
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon and count in top area
                  if (widget.icon != null || widget.count != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.icon != null)
                          Icon(
                            widget.icon,
                            color: widget.textColor.withValues(alpha: 0.9),
                            size: 32,
                          ),
                        if (widget.count != null)
                          Text(
                            widget.count!,
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w100,
                              height: 1.0,
                            ),
                          ),
                      ],
                    ),

                  const Spacer(),

                  // Title at bottom
                  Text(
                    widget.title.toLowerCase(),
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      height: 1.1,
                    ),
                    maxLines: widget.size == LiveTileSize.large ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Subtitle if provided
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle!,
                      style: TextStyle(
                        color: widget.textColor.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
      ),
    );
  }
}

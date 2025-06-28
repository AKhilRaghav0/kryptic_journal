import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:heroicons/heroicons.dart';
import '../../core/theme/app_theme.dart';

// HYBRID LIVE TILE - Windows Phone + iOS + Android
class HybridLiveTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? count;
  final dynamic icon; // Can accept both IconData and HeroIcons
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final HybridTileSize size;
  final VoidCallback? onTap;
  final Widget? child;
  final bool useGradient;
  final bool useElevation;

  const HybridLiveTile({
    super.key,
    required this.title,
    this.subtitle,
    this.count,
    this.icon,
    this.backgroundColor,
    this.gradient,
    this.size = HybridTileSize.small,
    this.onTap,
    this.child,
    this.useGradient = false,
    this.useElevation = true,
  });

  @override
  State<HybridLiveTile> createState() => _HybridLiveTileState();
}

enum HybridTileSize {
  small, // 150x150
  wide, // 320x150
  large, // 320x320
}

class _HybridLiveTileState extends State<HybridLiveTile> {
  bool _isPressed = false;

  double get _tileWidth {
    switch (widget.size) {
      case HybridTileSize.small:
        return 150;
      case HybridTileSize.wide:
        return 320;
      case HybridTileSize.large:
        return 320;
    }
  }

  double get _tileHeight {
    switch (widget.size) {
      case HybridTileSize.small:
        return 150;
      case HybridTileSize.wide:
        return 150;
      case HybridTileSize.large:
        return 320;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _tileWidth,
                height: _tileHeight,
                margin: const EdgeInsets.all(6),
                transform: Matrix4.identity()..scale(_isPressed ? 0.96 : 1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // iOS-inspired corners
                  gradient: widget.useGradient ? widget.gradient : null,
                  color: widget.useGradient ? null : widget.backgroundColor,
                  boxShadow: widget.useElevation && !_isPressed
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: widget.child ?? _buildDefaultContent(),
              )
              .animate()
              .fadeIn(duration: 400.ms, curve: Curves.easeOut)
              .scaleXY(begin: 0.8, duration: 400.ms, curve: Curves.easeOutBack),
    );
  }

  Widget _buildDefaultContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section with icon and count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.icon != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: widget.icon is HeroIcons 
                    ? HeroIcon(widget.icon as HeroIcons, color: Colors.white, size: 24)
                    : Icon(widget.icon as IconData, color: Colors.white, size: 24),
                ),
              if (widget.count != null)
                Text(
                  widget.count!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    height: 1.0,
                  ),
                ),
            ],
          ),

          const Spacer(),

          // Bottom section with title and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title.toLowerCase(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                maxLines: widget.size == HybridTileSize.large ? 3 : 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  widget.subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// HYBRID CARD - iOS design + Material elevation + Windows Phone colors
class HybridCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final bool useElevation;
  final bool useGradient;

  const HybridCard({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.gradient,
    this.padding,
    this.margin,
    this.borderRadius = 16,
    this.useElevation = true,
    this.useGradient = false,
  });

  @override
  State<HybridCard> createState() => _HybridCardState();
}

class _HybridCardState extends State<HybridCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.onTap != null
          ? (_) => setState(() => _isPressed = false)
          : null,
      onTapCancel: widget.onTap != null
          ? () => setState(() => _isPressed = false)
          : null,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin:
            widget.margin ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: widget.useGradient ? widget.gradient : null,
          color: widget.useGradient
              ? null
              : (widget.backgroundColor ?? AppTheme.backgroundWhite.withValues(alpha: 0.95)),
          boxShadow: widget.useElevation && !_isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
          border: Border.all(
            color: AppTheme.backgroundWhite.withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
        child: Container(
          padding: widget.padding ?? const EdgeInsets.all(16),
          child: widget.child,
        ),
      ),
    );
  }
}

// HYBRID LIST ITEM - Clean iOS design + Android ripple + Windows Phone accent
class HybridListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Color? accentColor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  const HybridListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.accentColor,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return HybridCard(
      onTap: onTap,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Leading widget or accent bar
          if (leading != null)
            leading!
          else if (accentColor != null)
            Container(
              width: 4,
              height: 50,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

          if (leading != null || accentColor != null) const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyLarge),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
                ],
              ],
            ),
          ),

          // Trailing widget
          if (trailing != null) ...[
            const SizedBox(width: 12),
            trailing!,
          ] else if (onTap != null) ...[
            const SizedBox(width: 12),
            HeroIcon(HeroIcons.chevronRight, color: AppTheme.textLight, size: 20),
          ],
        ],
      ),
    );
  }
}

// FLOATING ACTION GROUP - Android FAB + iOS design + Windows Phone colors
class HybridFloatingActionGroup extends StatefulWidget {
  final List<HybridFloatingAction> actions;
  final dynamic mainIcon; // Can accept both IconData and HeroIcons
  final Color? backgroundColor;
  final bool isExpanded;
  final VoidCallback? onMainTap;

  const HybridFloatingActionGroup({
    super.key,
    required this.actions,
    this.mainIcon = HeroIcons.plus,
    this.backgroundColor,
    this.isExpanded = false,
    this.onMainTap,
  });

  @override
  State<HybridFloatingActionGroup> createState() =>
      _HybridFloatingActionGroupState();
}

class _HybridFloatingActionGroupState extends State<HybridFloatingActionGroup>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Action buttons
        ...widget.actions.asMap().entries.map((entry) {
          final index = entry.key;
          final action = entry.value;

          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 50)),
            curve: Curves.easeOutBack,
            height: _isExpanded ? 60 : 0,
            child: _isExpanded
                ? Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor:
                          action.backgroundColor ?? AppTheme.primaryAccent,
                      onPressed: action.onTap,
                      child: action.icon is HeroIcons 
                        ? HeroIcon(action.icon as HeroIcons, color: Colors.white)
                        : Icon(action.icon as IconData, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          );
        }).toList(),

        // Main FAB
        FloatingActionButton(
          backgroundColor: widget.backgroundColor ?? AppTheme.primaryAccent,
          onPressed: widget.onMainTap ?? _toggleExpanded,
          child: AnimatedRotation(
            turns: _isExpanded ? 0.125 : 0, // 45 degree rotation
            duration: const Duration(milliseconds: 300),
            child: widget.mainIcon is HeroIcons 
              ? HeroIcon(widget.mainIcon as HeroIcons, color: Colors.white)
              : Icon(widget.mainIcon as IconData, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class HybridFloatingAction {
  final dynamic icon; // Can accept both IconData and HeroIcons
  final VoidCallback onTap;
  final Color? backgroundColor;
  final String? tooltip;

  HybridFloatingAction({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.tooltip,
  });
}

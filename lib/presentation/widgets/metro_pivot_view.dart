import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_theme.dart';

class PivotItem {
  final String title;
  final Widget content;
  final IconData? icon;

  PivotItem({required this.title, required this.content, this.icon});
}

class MetroPivotView extends StatefulWidget {
  final List<PivotItem> items;
  final int initialIndex;

  const MetroPivotView({super.key, required this.items, this.initialIndex = 0});

  @override
  State<MetroPivotView> createState() => _MetroPivotViewState();
}

class _MetroPivotViewState extends State<MetroPivotView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late ScrollController _headerScrollController;
  late AnimationController _slideAnimationController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _headerScrollController = ScrollController();
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _headerScrollController.dispose();
    _slideAnimationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    _autoSlideHeaders(index);
  }

  void _onHeaderTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
    _autoSlideHeaders(index);
  }

  void _autoSlideHeaders(int index) {
    // Don't slide if it's the last element
    if (index >= widget.items.length - 1) return;

    // Calculate slide offset based on index
    double targetOffset = index * 120.0; // Adjust based on header width

    // Smooth scroll to position
    _headerScrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );

    // Trigger slide animation
    _slideAnimationController.forward().then((_) {
      _slideAnimationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enhanced Pivot Headers with auto-slide
        Container(
          height: 90,
          color: AppTheme.backgroundWhite,
          child: ListView.builder(
            controller: _headerScrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 24, top: 16),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = index == _currentIndex;

              return GestureDetector(
                onTap: () => _onHeaderTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bold, round text when selected
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: isSelected ? 42 : 36,
                          fontWeight: isSelected
                              ? FontWeight.w800
                              : FontWeight.w200,
                          letterSpacing: isSelected ? -1.2 : -0.8,
                          color: isSelected
                              ? AppTheme.textPrimary
                              : AppTheme.textLight,
                          height: 1.0,
                        ),
                        child: Text(item.title.toLowerCase()),
                      ).animate(
                        effects: isSelected
                            ? [
                                const ScaleEffect(
                                  begin: Offset(0.95, 0.95),
                                  end: Offset(1.0, 1.0),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOutBack,
                                ),
                              ]
                            : [],
                      ),

                      const SizedBox(height: 8),

                      // Animated selection indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 3,
                        width: isSelected ? 60 : 0,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryAccent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Content Area with enhanced animations
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return widget.items[index].content
                  .animate(key: ValueKey(index))
                  .fadeIn(duration: 500.ms, curve: Curves.easeOutCubic)
                  .slideX(
                    begin: 0.02,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  )
                  .scaleXY(
                    begin: 0.98,
                    end: 1.0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  );
            },
          ),
        ),
      ],
    );
  }
}

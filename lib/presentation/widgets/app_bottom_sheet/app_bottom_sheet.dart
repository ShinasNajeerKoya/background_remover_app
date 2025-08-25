import 'package:background_remover_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

/// A utility class for showing customizable bottom sheets.
class AppBottomSheet {
  /// Shows a draggable scrollable bottom sheet with custom content.
  static Future<T?> showDraggable<T>({
    required BuildContext context,
    required Widget Function(
      BuildContext context,
      ScrollController scrollController,
      DraggableScrollableController draggableController,
    )
    builder,
    bool showDragHandle = true,
    double initialSize = 0.5,
    double maxSize = 1.0,
    double minSize = 0.25,
    double borderRadius = 20.0,
    double handleBottomPadding = 16.0,
    EdgeInsets margin = const EdgeInsets.all(8.0),
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    final theme = Theme.of(context);
    final draggableScrollController = DraggableScrollableController();

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor ?? theme.colorScheme.scrim.withOpacity(0.7),
      builder: (context) {
        return Container(
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: homeGoldenGradient,
            ),
          ),
          child: DraggableScrollableSheet(
            controller: draggableScrollController,
            initialChildSize: initialSize,
            maxChildSize: maxSize,
            minChildSize: minSize,
            expand: false,
            builder: (context, scrollController) {
              return Column(
                children: [
                  if (showDragHandle)
                    Padding(
                      padding: EdgeInsets.only(top: 12, bottom: handleBottomPadding),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 28,
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  Expanded(child: builder(context, scrollController, draggableScrollController)),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

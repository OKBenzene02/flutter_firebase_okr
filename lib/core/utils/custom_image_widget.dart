import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageType { local, network, cached, svg }

class CustomImageWidget extends StatefulWidget {
  final String? url;
  final String? assetPath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final ColorFilter? color;
  final ImageType type;

  const CustomImageWidget.asset({
    super.key,
    this.assetPath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
  }) : type = ImageType.local,
       url = null,
       errorWidget = null,
       color = null;

  const CustomImageWidget.network({
    super.key,
    this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : type = ImageType.network,
       assetPath = null,
       color = null;

  const CustomImageWidget.cached({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : type = ImageType.cached,
       assetPath = null,
       color = null;

  const CustomImageWidget.svg({
    super.key,
    this.assetPath,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.cover,
    this.placeholder,
  }) : type = ImageType.svg,
       url = null,
       errorWidget = null;

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case .local:
        return _buildLocalImage(context);
      case .network:
        return _buildNetworkImage(context);
      case .cached:
        return _buildCachedImage(context);
      case .svg:
        return _buildSVGImage(context);
    }
  }

  Widget _buildLocalImage(BuildContext context) {
    if (widget.assetPath == null || widget.assetPath!.isEmpty) {
      return _placeholder(context);
    }

    return Image.asset(
      widget.assetPath!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) =>
          widget.placeholder ?? _placeholder(context),
    );
  }

  Widget _buildSVGImage(BuildContext context) {
    if (widget.assetPath == null || widget.assetPath!.isEmpty) {
      return _placeholder(context);
    }

    return SvgPicture.asset(
      widget.assetPath!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      colorFilter: widget.color,
      errorBuilder: (context, error, stackTrace) =>
          widget.placeholder ?? _placeholder(context),
    );
  }

  Widget _buildCachedImage(BuildContext context) {
    if (widget.url == null || widget.url!.isEmpty) {
      return _placeholder(context);
    }

    return CachedNetworkImage(
      imageUrl: widget.url!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      placeholder: (context, url) => widget.placeholder ?? _shimmer(context),
      errorWidget: (context, url, error) =>
          widget.placeholder ?? _placeholder(context),
    );
  }

  Widget _buildNetworkImage(BuildContext context) {
    if (widget.url == null || widget.url!.isEmpty) return _placeholder(context);

    return Image.network(
      widget.url!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return widget.placeholder ?? _shimmer(context);
      },
      errorBuilder: (context, error, stackTrace) =>
          widget.errorWidget ?? _placeholder(context),
    );
  }

  Widget _shimmer(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surfaceContainerHighest,
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
    );
  }

  // Placeholder image content
  Widget _placeholder(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

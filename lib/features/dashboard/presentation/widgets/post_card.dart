import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/core/utils/custom_image_widget.dart';
import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';

class PostCard extends StatefulWidget {
  final PostsEntity post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _currentImageIndex = 0;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.isLiked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        _postHeader(),
        _imageCarouselSection(),
        _interactiveIcons(),
        _postInformationFooter(),
        const SizedBox(height: 12),
      ],
    );
  }

  // ── Header ──────────────────────────────────────────────
  Widget _postHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _showUserProfilePic(),
          const SizedBox(width: 8),
          _showUserName(),
          const Spacer(),
          _showOverflowMenu(),
        ],
      ),
    );
  }

  Widget _showUserProfilePic() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
        ),
        width: 36,
        height: 36,
        child: ClipOval(
          child: CustomImageWidget.cached(
            url: widget.post.user?.profileImage,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _showUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.post.user?.username ?? widget.post.user?.name ?? '',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        if (widget.post.user?.isVerified == true)
          const Icon(Icons.verified, size: 12, color: Colors.blue),
      ],
    );
  }

  Widget _showOverflowMenu() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withValues(alpha: 0.3),
          builder: (_) => _postOptionsSheet(),
        );
      },
      child: Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CustomImageWidget.svg(
            assetPath: AppImages.overflowMenu(context),
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }

  Widget _postOptionsSheet() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.6),
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                    width: 50,
                    height: 6,
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_border),
                    title: const Text('Save'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.share_outlined),
                    title: const Text('Share'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.flag_outlined),
                    title: const Text('Report'),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Image Carousel ───────────────────────────────────────
  Widget _imageCarouselSection() {
    final images = widget.post.postImages;
    if (images == null || images.isEmpty) return const SizedBox.shrink();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) =>
                setState(() => _currentImageIndex = index),
            itemBuilder: (context, index) {
              return CustomImageWidget.cached(
                url: images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),

        // dot indicators — only show if multiple images
        if (images.length > 1)
          Positioned(
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _currentImageIndex == index ? 8 : 5,
                  height: _currentImageIndex == index ? 8 : 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ── Interactive Icons ────────────────────────────────────
  Widget _interactiveIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        spacing: 4,
        children: [
          // like
          GestureDetector(
            onTap: () => setState(() => _isLiked = !_isLiked),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.elasticOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _isLiked
                  ? CustomImageWidget.svg(
                      key: const ValueKey('liked'),
                      assetPath: AppImages.likeFilled(context),
                      width: 20,
                      height: 20,
                      color: ColorFilter.mode(
                        Theme.of(context).colorScheme.error,
                        .srcIn,
                      ),
                    )
                  : CustomImageWidget.svg(
                      key: const ValueKey('unliked'),
                      assetPath: AppImages.like(context),
                      width: 20,
                      height: 20,
                    ),
            ),
          ),
          const SizedBox(width: 14),

          // comment
          GestureDetector(
            onTap: () {},
            child: CustomImageWidget.svg(
              assetPath: AppImages.comment(context),
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 14),

          // share
          GestureDetector(
            onTap: () {},
            child: CustomImageWidget.svg(
              assetPath: AppImages.send(context),
              width: 20,
              height: 20,
            ),
          ),

          const Spacer(),

          // bookmark
          GestureDetector(
            onTap: () {},
            child: CustomImageWidget.svg(
              assetPath: AppImages.bookmark(context),
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  // ── Footer ───────────────────────────────────────────────
  Widget _postInformationFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // likes count
          if ((widget.post.likesCount ?? 0) > 0)
            Text(
              '${widget.post.likesCount} likes',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),

          const SizedBox(height: 2),

          // caption
          if (widget.post.caption != null && widget.post.caption!.isNotEmpty)
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: 13),
                children: [
                  TextSpan(
                    text:
                        widget.post.user?.username ??
                        widget.post.user?.name ??
                        '',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(text: '  '),
                  TextSpan(text: widget.post.caption),
                ],
              ),
            ),

          const SizedBox(height: 4),

          // timestamp
          if (widget.post.createdAt != null)
            Text(
              _formatDate(widget.post.createdAt!),
              style: TextStyle(
                fontSize: 11,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}

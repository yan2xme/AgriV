import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:io';
import 'dart:math' as math;
import '../viewsmodels/chat_viewmodel.dart';

class ChatView extends StatefulWidget {
  final String diseaseName;
  final String diseaseDescription;
  final String? imagePath;

  const ChatView({
    super.key,
    required this.diseaseName,
    required this.diseaseDescription,
    this.imagePath,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatViewModel _viewModel = ChatViewModel();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel.initializeChat(
      widget.diseaseName,
      widget.diseaseDescription,
      widget.imagePath,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4F6F52)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.smart_toy_outlined, color: Color(0xFF4F6F52)),
            SizedBox(width: 8),
            Text(
              'AI Chatbot',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w800,
                color: Color(0xFF4F6F52),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // "Today" Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Today",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),

          Expanded(
            child: ListenableBuilder(
              listenable: _viewModel,
              builder: (context, child) {
                final chatEntries = _viewModel.chatHistory.entries.toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: chatEntries.length,
                  itemBuilder: (context, index) {
                    final message = chatEntries[index].value;
                    final isUser = message['isUser'];
                    final isThinking = !isUser && message['text'] == 'Thinking...';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isUser) ...[
                            const CircleAvatar(
                              backgroundColor: Color(0xFFE8EFE9),
                              child: Icon(Icons.smart_toy_outlined, color: Color(0xFF4F6F52)),
                            ),
                            const SizedBox(width: 8),
                          ],

                          // Chat Bubble
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isUser ? const Color(0xFF4F6F52) : const Color(0xFFF0F0F0),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20),
                                  bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(0),
                                  bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // -------------------------------------------------
                                  // THE FIX: Bulletproof Image Loading inside Chat
                                  // -------------------------------------------------
                                  if (message['imagePath'] != null)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Builder(
                                          builder: (context) {
                                            final path = message['imagePath'] as String;

                                            // Handle Library Assets
                                            if (path.startsWith('lib/') || path.startsWith('assets/')) {
                                              return Image.asset(
                                                path,
                                                height: 150,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) => Container(
                                                  height: 150,
                                                  color: Colors.grey[300],
                                                  child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                                                ),
                                              );
                                            }

                                            // Handle Camera/Scanner Files
                                            return Image.file(
                                              File(path),
                                              height: 150,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) => Container(
                                                height: 150,
                                                color: Colors.grey[300],
                                                child: const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),

                                  // Render Text or Markdown
                                  if (isThinking)
                                    const TypingIndicator()
                                  else
                                    MarkdownBody(
                                      data: message['text'],
                                      styleSheet: MarkdownStyleSheet(
                                        p: TextStyle(
                                          color: isUser ? Colors.white : Colors.black87,
                                          height: 1.4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        strong: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isUser ? Colors.white : const Color(0xFF4F6F52),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),

                          if (isUser) ...[
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              backgroundImage: AssetImage('lib/views/assets/profile.jpg'),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Bottom Input Field
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image_outlined, color: Colors.grey),
                    onPressed: () {
                      _viewModel.pickImage();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'I-describe ang iyong problema...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onSubmitted: (value) {
                        _viewModel.sendMessage(value, isUser: true);
                        _textController.clear();
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF4F6F52),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 18),
                      onPressed: () {
                        _viewModel.sendMessage(_textController.text, isUser: true);
                        _textController.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Custom Floating Dots Loading Indicator
// ==========================================
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200)
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = math.sin((_controller.value - delay) * math.pi * 2);
        final dy = (value > 0 ? value : 0.0) * -6.0;

        return Transform.translate(
          offset: Offset(0, dy),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
                radius: 4,
                backgroundColor: const Color(0xFF4F6F52).withValues(alpha: 0.6)
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDot(0.0),
          _buildDot(0.1),
          _buildDot(0.2),
        ],
      ),
    );
  }
}
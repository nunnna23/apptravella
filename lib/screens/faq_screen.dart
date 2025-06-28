import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'Can I cancel my booking?',
      answer:
          'Yes - any cancellation fees are determined by the property and listed in your cancellation policy. You\'ll pay any additional costs to the property.',
    ),
    FAQItem(
      question: 'What currently distinguishes Travella from its competitors?',
      answer:
          'We have a very broad offering of different accommodation types and rates, including all of the major Online Travel Agencies, hotel chains and alternative accommodation sources.',
    ),
    FAQItem(
      question:
          'How do you determine the order in which accommodations are listed in your search results?',
      answer:
          'Travella ranks results based on a combination of search results in near-real-time. The results reflect the search criteria of the user and our assessment of the attractiveness of the offer compared to other offers available on our site.',
    ),
    FAQItem(
      question: 'What other sources of revenue do you have other than CPC?',
      answer:
          'Our primary model is CPC (cost per click) generated through auction on our marketplace. Recently CPA (cost per acquisition) was introduced where we charge commission on a booking instead of charging per click. We\'re continuously developing and working with alternate revenue streams such as display ads.',
    ),
    FAQItem(
      question:
          'Why is Travella still hiring people if the travel industry is under pressure?',
      answer:
          'Travella is fully focused on the future of travel by targeting our resources to specific areas and adapting our offering to the restart of the travel industry after months of complete shutdown. This meant changes to our strategy and some changes to our organizational structure to meet this adjustment. Our core product teams remain strong and unaffected by the structural changes.',
    ),
    FAQItem(
      question: 'How are teams currently working together?',
      answer:
          'Over the course of lockdown we had to switch to a fully remote setup. From the beginning, we increased the frequency of our usual internal communication formats, and set up company-wide Q&As to share the latest business and strategic updates, and answer talents\' questions and concerns.',
    ),
    FAQItem(
      question: 'How do I confirm that I paid for my booking?',
      answer:
          'You\'ll find payment confirmation in your confirmation email. In the email, there\'s also an option to download the payment confirmation as a pdf.',
    ),
    FAQItem(
      question: 'Where can I find my booking\'s payment policy?',
      answer:
          'Travella.com will charge your card for the total price of the booking when you book. If you\'re looking for more info about your payment, check your confirmation email.',
    ),
    FAQItem(
      question: 'I was charged. Do I need to do anything else?',
      answer:
          'No, you\'re all set. We charged you for the price of the booking. If there are additional taxes or charges, this info should be displayed on the property page.',
    ),
    FAQItem(
      question: 'Will I need to pay anything extra on arrival?',
      answer:
          'Sometimes you\'re expected to pay taxes and charges upon arrival. If this is the case, the amount is stated in your booking and in your confirmation email. If no amount is stated, you shouldn\'t pay anything upon arrival.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _faqItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: FAQExpansionTile(faqItem: _faqItems[index]),
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}

class FAQExpansionTile extends StatefulWidget {
  final FAQItem faqItem;

  const FAQExpansionTile({
    super.key,
    required this.faqItem,
  });

  @override
  State<FAQExpansionTile> createState() => _FAQExpansionTileState();
}

class _FAQExpansionTileState extends State<FAQExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF406F89),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            widget.faqItem.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            widget.faqItem.isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          onExpansionChanged: (isExpanded) {
            setState(() {
              widget.faqItem.isExpanded = isExpanded;
            });
          },
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.faqItem.answer,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

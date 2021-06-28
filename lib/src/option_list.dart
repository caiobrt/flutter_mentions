part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.color,
    this.margin,
    this.suggestionBuilder,
    this.suggestionListDecoration,
  });

  final Color? color;
  
  final EdgeInsets? margin;

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SafeArea(
          child: Container(
              margin: margin ?? EdgeInsets.zero,
              decoration:
                  suggestionListDecoration ?? BoxDecoration(color: Colors.white),
              constraints: BoxConstraints(
                maxHeight: suggestionListHeight,
                minHeight: 0,
              ),
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    color: color ?? Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        onTap(data[index]);
                      },
                      child: suggestionBuilder != null
                          ? suggestionBuilder!(data[index])
                          : Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                data[index]['display'],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                    );
                },
              ),
            ),
        )
        : Container();
  }
}

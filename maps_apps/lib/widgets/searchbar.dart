part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return buildSearchBar(context);
    });
  }

  Widget buildSearchBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        child: GestureDetector(
          onTap: () async {
            final SearchResult result = await showSearch(
                context: context, delegate: SearchDestination());
            searchReturn(context, result);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Text(
              "Onde pretende ir ?",
            ),
          ),
        ),
      ),
    );
  }

  void searchReturn(BuildContext context, SearchResult searchResult) {
    if (searchResult.cancel) return;

    if (searchResult.manual) {
      context.bloc<SearchBloc>().add(OnActiveManualMarker());
      return;
    }
  }
}

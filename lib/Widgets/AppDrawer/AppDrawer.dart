import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/CustomIcons.dart';
import 'package:acropolis_member_management/Routes/route_names.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/ListTiles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;
  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Container(
          width: 250,
          child: Drawer(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Color(0xFF1B1B1B),
                        border: Border.all(color: Colors.white12),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(20.0))),
                    //color: Color(0xff1B1B1B),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(height: 25),
                        Image.asset("assets/AcropolisWhiteLogo.png",
                            width: 90, height: 90),
                        SizedBox(height: 25),

                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.dashboard_rounded),
                            title: const Text(
                              "Dashboard",
                            ),
                            trailing: (_selectedRoute == RouteNames.dashScreen)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.dashScreen);
                            },
                            selected: _selectedRoute == RouteNames.dashScreen,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.green,
                          child: ListTile(
                            leading: const Icon(Icons.person_add), //Icon(Icons.person_add),
                            title: const Text(
                              "Add Members",
                            ),
                            trailing: (_selectedRoute == RouteNames.add_member)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.add_member);
                            },
                            selected: _selectedRoute == RouteNames.add_member,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.yellow[300],
                          child: ListTile(
                            leading: const Icon(
                                Icons.search), //Icon(Icons.person_search),
                            title: const Text(
                              "Find Member",
                            ),
                            trailing: (_selectedRoute == RouteNames.find_member)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.find_member);
                            },
                            selected: _selectedRoute == RouteNames.find_member,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.red,
                          child: ListTile(
                            leading: const Icon(FontAwesomeIcons.calendarDay),
                            title: const Text(
                              "Billing Members",
                            ),
                            trailing:
                                (_selectedRoute == RouteNames.billing_member)
                                    ? SelectedTileDot()
                                    : null,
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.billing_member);
                            },
                            selected:
                                _selectedRoute == RouteNames.billing_member,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.blue,
                          child: ListTile(
                            leading: const Icon(FontAwesomeIcons.desktop),
                            title: const Text(
                              "Desk Check-Ins",
                            ),
                            trailing: (_selectedRoute == RouteNames.check_in)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.check_in);
                            },
                            selected: _selectedRoute == RouteNames.check_in,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.blue,
                          child: ListTile(
                            leading: const Icon(FontAwesomeIcons.tablet),
                            title: const Text(
                              "iPad Kiosk",
                            ),
                            trailing: (_selectedRoute == RouteNames.kioskPage)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.kioskPage);
                            },
                            selected: _selectedRoute == RouteNames.kioskPage,
                          ),
                        ),
                        /*
                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.show_chart_outlined),
                            title: const Text(
                              "Visitor History",
                            ),
                            trailing: (_selectedRoute == RouteNames.visitorHistory)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.visitorHistory);
                            },
                            selected:
                                _selectedRoute == RouteNames.visitorHistory,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.do_not_disturb_alt),//Icon(Icons.calculate),
                            title: const Text(
                              "Calculator",
                            ),
                            trailing: (_selectedRoute == RouteNames.calculator)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.calculator);
                            },
                            selected: _selectedRoute == RouteNames.calculator,
                          ),
                        ),*/
                        ListTileTheme(
                          iconColor: Colors.green,
                          child: ListTile(
                            leading: const Icon(MyCustomIcons.posIcon, size: 40,),
                            title: const Text(
                              "Point of Sale",
                            ),
                            trailing: (_selectedRoute == RouteNames.inventory)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.inventory);
                            },
                            selected: _selectedRoute == RouteNames.inventory,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.green,
                          child: ListTile(
                            leading: Icon(MyCustomIcons.posIcon, size: 40),
                            title: const Text(
                              "Memberships",
                            ),
                            trailing: (_selectedRoute == RouteNames.memberships)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.memberships);
                            },
                            selected: _selectedRoute == RouteNames.memberships,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Colors.yellow[300],
                          child: ListTile(
                            contentPadding:EdgeInsets.only(left: -5.0)  ,
                            leading: const Icon(MyCustomIcons.inventoryIcon, size: 40),
                            title: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("Inventory Manager")),
                            trailing:
                                (_selectedRoute == RouteNames.inventoryManager)
                                    ? SelectedTileDot()
                                    : null,
                            onTap: () async {
                              await _navigateTo(
                                  context, RouteNames.inventoryManager);
                            },
                            selected:
                                _selectedRoute == RouteNames.inventoryManager,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(Icons.history_rounded),
                            title: const Text(
                              "History",
                            ),
                            trailing: (_selectedRoute == RouteNames.history)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.history);
                            },
                            selected: _selectedRoute == RouteNames.history,
                          ),
                        ),
                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: const Icon(MyCustomIcons.flyerIcon),
                            title: const Text(
                              "Flyer",
                            ),
                            trailing: (_selectedRoute == RouteNames.flyerPage)
                                ? SelectedTileDot()
                                : null,
                            onTap: () async {
                              await _navigateTo(context, RouteNames.flyerPage);
                            },
                            selected: _selectedRoute == RouteNames.flyerPage,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                if (widget.permanentlyDisplay)
                  const VerticalDivider(
                    width: 1,
                  )
              ],
            ),
          )),
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}

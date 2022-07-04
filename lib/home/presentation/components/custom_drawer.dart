import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/presentation/store/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FiltersEntity _filtersEntity = FiltersEntity();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [
              const SizedBox(height: 16),
              const Text('Selecione qual moeda deseja comparar'),
              DropdownButton<String>(
                hint: const Text('USD'),
                value: _filtersEntity.vscurrency,
                items: FiltersEntity.currentCoin
                    .map(
                      (coin) => DropdownMenuItem(
                        value: coin.toLowerCase(),
                        child: Text(
                          coin,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _filtersEntity.vscurrency = value!;
                  });
                },
              ),
              ExpansionTile(
                title: const Text('Deseja ordenar por:'),
                children: FiltersEntity.orderBy.map((order) {
                  return ListTile(
                    trailing: Radio<String>(
                      value: order.name,
                      groupValue: _filtersEntity.order,
                      onChanged: (value) {
                        setState(() {
                          _filtersEntity.order = order.name;
                        });
                      },
                    ),
                    title: Text(order.name),
                  );
                }).toList(),
              ),
              ExpansionTile(
                title: const Text('Price percentage change'),
                children: FiltersEntity.percentageChange
                    .map(
                      (percentage) => SwitchListTile(
                        title: Text(percentage.name),
                        onChanged: (value) {
                          setState(() {
                            _filtersEntity.priceChangePercentage +=
                                '${percentage.name},';
                            percentage.value = value;
                          });
                        },
                        value: percentage.value,
                      ),
                    )
                    .toList(),
              ),
              const Text('ids'),
              CheckboxListTile(
                value: _filtersEntity.sparkline,
                onChanged: (value) {
                  setState(() {
                    _filtersEntity.sparkline = value!;
                  });
                },
                title: const Text('bluebenx'),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  var postbloc = context.read<PostBloc>();

                  postbloc.add(PostFetched(
                    filtersEntity: FiltersEntity(),
                    newFilters: true,
                  ));
                },
                child: const Text('Filtrar'),
              )
            ]),
          )
        ],
      ),
    ));
  }
}

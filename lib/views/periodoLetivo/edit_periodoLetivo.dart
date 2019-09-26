import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperperiodo.dart';
import 'package:magister_mobile/data/models/periodoletivo.dart';
import 'package:magister_mobile/views/util/widgetUtil.dart';

class EditPeriodoLetivo extends StatefulWidget {
  final bool edit;
  final PeriodoLetivo periodo;

  EditPeriodoLetivo(this.edit, {this.periodo})
      : assert(edit == true || periodo == null);
  @override
  _EditPeriodoLetivoState createState() => _EditPeriodoLetivoState();
}

class _EditPeriodoLetivoState extends State<EditPeriodoLetivo> {
  TextEditingController anoController = TextEditingController();
  TextEditingController semestreController = TextEditingController();
  TextEditingController dataInicioController = TextEditingController();
  TextEditingController dataFinalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      anoController.text = widget.periodo.ano.toString();
      semestreController.text = widget.periodo.semestre.toString();
      dataInicioController.text = widget.periodo.dataInicio;
      dataFinalController.text = widget.periodo.dataInicio;
    }
  }

  void onPressed() async {
    if (!_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Carregando...')));
    } else if (widget.edit == true) {
      HelperPeriodo.getInstance().update(new PeriodoLetivo(
        ano: widget.periodo.ano,
        semestre: widget.periodo.semestre,
        dInicio: dataInicioController.text,
        dFinal: dataFinalController.text,
      ));
      Navigator.pop(context);
    } else {
      await HelperPeriodo.getInstance().save(
        new PeriodoLetivo(
          ano: int.parse(anoController.text),
          semestre: int.parse(semestreController.text),
          dInicio: dataInicioController.text,
          dFinal: dataFinalController.text,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
            Text(widget.edit ? "Editar Periodo Letivo" : "Novo Periodo Letivo"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Image.asset("assets/periodo.png"),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    formField(
                        anoController,
                        "Ano",
                        Icons.apps,
                        TextInputType.number,
                        Colors.lightGreen,
                        widget.edit ? widget.periodo.ano : "a"),
                    formField(
                        semestreController,
                        "Semestre",
                        Icons.apps,
                        TextInputType.number,
                        Colors.lightGreen,
                        widget.edit ? widget.periodo.semestre : "s"),
                    formField(
                        dataInicioController,
                        "Data Inicio",
                        Icons.date_range,
                        TextInputType.text,
                        Colors.lightGreen,
                        widget.edit ? widget.periodo.dataInicio : "i"),
                    formField(
                        dataFinalController,
                        "Data Final",
                        Icons.date_range,
                        TextInputType.text,
                        Colors.lightGreen,
                        widget.edit ? widget.periodo.dataFinal : "f"),
                    buttonSave(Colors.lightGreen, Colors.lightGreenAccent,
                        context, onPressed),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

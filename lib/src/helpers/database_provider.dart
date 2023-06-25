import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, "health_safe.db");

    return await openDatabase(path,
        version: 6,
        onCreate: (Database db, int version) async => await createTables(db));
  }

  Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE turno(
        id INTEGER PRIMARY KEY,
        fecha DATE NOT NULL,
        fechaSolicita DATE NOT NULL,
        horaInicio TIME NOT NULL,
        horaFin TIME NOT NULL,
        precio DOUBLE NOT NULL,
        idPago STRING NOT NULL,

        idAgendaTurnos INTEGER NOT NULL,

        idModalidadAtencion INTEGER NOT NULL,
        idConsultorio INTEGER NOT NULL,
        idProfesional INTEGER NOT NULL,
        idEspecialidad INTEGER NOT NULL,

        FOREIGN KEY(idModalidadAtencion) REFERENCES modalidadAtencion(id),
        FOREIGN KEY(idProfesional) REFERENCES profesional(id),
        FOREIGN KEY(idConsultorio) REFERENCES consultorio(id)
        FOREIGN KEY(idEspecialidad) REFERENCES especialidad(id)
        )
    ''');

    await db.execute(''' 
      CREATE TABLE modalidadAtencion(
        id INTEGER PRIMARY KEY,
        descripcion STRING NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE consultorio(
        id INTEGER PRIMARY KEY,
        descripcion TEXT,

        idDireccion INTEGER NOT NULL,

        FOREIGN KEY(idDireccion) REFERENCES direccion(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE direccion(
        id INTEGER PRIMARY KEY,
        calle TEXT,
        numero INTEGER,
        piso INTEGER,

        idLocalidad INTEGER NOT NULL,

        FOREIGN KEY(idLocalidad) REFERENCES localidad(codigoPostal)
      )
    ''');

    await db.execute('''
      CREATE TABLE localidad(
        codigoPostal STRING PRIMARY KEY,
        descripcion TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE profesionalEspecialidad(
        id INTEGER PRIMARY KEY,

        idProfesional INTEGER NOT NULL,
        idEspecialidad INTEGER NOT NULL,

        FOREIGN KEY(idProfesional) REFERENCES profesional(id),
        FOREIGN KEY(idEspecialidad) REFERENCES especialidad(id)
      )
     ''');

    await db.execute(''' 
      CREATE TABLE especialidad(
        id INTEGER PRIMARY KEY,
        descripcion STRING NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE profesional(
        id INTEGER PRIMARY KEY,
        descripcion TEXT,

        idUsuario INTEGER NOT NULL,

        FOREIGN KEY(idUsuario) REFERENCES usuario(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE usuario(
        id INTEGER PRIMARY KEY,
        correo STRING NOT NULL,
        nombre STRING NOT NULL,
        apellido STRING NOT NULL,
        urlImagenPerfil STRING NOT NULL,
        sexo STRING NOT NULL,

        idRol INTEGER NOT NULL,

        FOREIGN KEY(idRol) REFERENCES rol(id)
        )
      ''');

    await db.execute('''
      CREATE TABLE rol(
        id INTEGER PRIMARY KEY,
        descripcion STRING NOT NULL,
        )
      ''');

    await db.execute('''
      CREATE TABLE mensaje(
        id INTEGER PRIMARY KEY,
        idEmisor INTEGER NOT NULL,
        idReceptor INTEGER NOT NULL,
        mensaje STRING NOT NULL,
        horaFecha DATETIME NOT NULL,
        )
      ''');
  }
}

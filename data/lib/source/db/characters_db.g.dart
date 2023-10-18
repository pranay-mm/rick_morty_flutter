// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorCharactersDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CharactersDatabaseBuilder databaseBuilder(String name) =>
      _$CharactersDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CharactersDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$CharactersDatabaseBuilder(null);
}

class _$CharactersDatabaseBuilder {
  _$CharactersDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$CharactersDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CharactersDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CharactersDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CharactersDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CharactersDatabase extends CharactersDatabase {
  _$CharactersDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `dtcharacter` (`id` INTEGER, `name` TEXT, `image` TEXT, `status` TEXT, `species` TEXT, `gender` TEXT, `origin` TEXT, `location` TEXT, `episode` TEXT, `isFavorited` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _dTCharacterInsertionAdapter = InsertionAdapter(
            database,
            'dtcharacter',
            (DTCharacter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'status': item.status,
                  'species': item.species,
                  'gender': item.gender,
                  'origin': _dTOriginConverter.encode(item.origin),
                  'location': _dTLocationConverter.encode(item.location),
                  'episode': _dTEpisodeConverter.encode(item.episode),
                  'isFavorited': item.isFavorited ? 1 : 0
                }),
        _dTCharacterUpdateAdapter = UpdateAdapter(
            database,
            'dtcharacter',
            ['id'],
            (DTCharacter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'status': item.status,
                  'species': item.species,
                  'gender': item.gender,
                  'origin': _dTOriginConverter.encode(item.origin),
                  'location': _dTLocationConverter.encode(item.location),
                  'episode': _dTEpisodeConverter.encode(item.episode),
                  'isFavorited': item.isFavorited ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DTCharacter> _dTCharacterInsertionAdapter;

  final UpdateAdapter<DTCharacter> _dTCharacterUpdateAdapter;

  @override
  Future<List<DTCharacter>> getAllCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM dtcharacter',
        mapper: (Map<String, Object?> row) => DTCharacter(
            row['id'] as int?,
            row['name'] as String?,
            row['image'] as String?,
            row['status'] as String?,
            row['species'] as String?,
            row['gender'] as String?,
            _dTOriginConverter.decode(row['origin'] as String?),
            _dTLocationConverter.decode(row['location'] as String?),
            _dTEpisodeConverter.decode(row['episode'] as String?),
            (row['isFavorited'] as int) != 0));
  }

  @override
  Future<DTCharacter?> findCharacterById(int id) async {
    return _queryAdapter.query('SELECT * FROM dtcharacter WHERE id = ?1',
        mapper: (Map<String, Object?> row) => DTCharacter(
            row['id'] as int?,
            row['name'] as String?,
            row['image'] as String?,
            row['status'] as String?,
            row['species'] as String?,
            row['gender'] as String?,
            _dTOriginConverter.decode(row['origin'] as String?),
            _dTLocationConverter.decode(row['location'] as String?),
            _dTEpisodeConverter.decode(row['episode'] as String?),
            (row['isFavorited'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<int?> getCharactersCount() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM dtcharacter',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<DTCharacter>> getFavAllCharacters() async {
    return _queryAdapter.queryList(
        'SELECT * FROM dtcharacter WHERE isFavorited = true',
        mapper: (Map<String, Object?> row) => DTCharacter(
            row['id'] as int?,
            row['name'] as String?,
            row['image'] as String?,
            row['status'] as String?,
            row['species'] as String?,
            row['gender'] as String?,
            _dTOriginConverter.decode(row['origin'] as String?),
            _dTLocationConverter.decode(row['location'] as String?),
            _dTEpisodeConverter.decode(row['episode'] as String?),
            (row['isFavorited'] as int) != 0));
  }

  @override
  Future<void> insertsCharacters(List<DTCharacter> list) async {
    await _dTCharacterInsertionAdapter.insertList(
        list, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateFavouriteCharater(DTCharacter char) async {
    await _dTCharacterUpdateAdapter.update(char, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dTOriginConverter = DTOriginConverter();
final _dTLocationConverter = DTLocationConverter();
final _dTEpisodeConverter = DTEpisodeConverter();

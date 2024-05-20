import pymysql

def connect_to_rds(host, user, password, database):
    """
    Stellt eine Verbindung zu einer MariaDB-Datenbank auf einer RDS-Instanz her.

    :param host: Der Endpunkt der RDS-Datenbankinstanz.
    :param user: Der Benutzername für die Datenbankverbindung.
    :param password: Das Passwort für die Datenbankverbindung.
    :param database: Der Name der Datenbank, auf die zugegriffen werden soll.
    :return: Die Verbindung und der Cursor.
    """
    try:
        # Verbindung zur Datenbank herstellen
        connection = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=database,
            cursorclass=pymysql.cursors.DictCursor  # Verwenden Sie DictCursor für bessere Lesbarkeit der Ergebnisse
        )
        print("Verbindung zur Datenbank erfolgreich hergestellt.")
        return connection
    except pymysql.MySQLError as e:
        print(f"Fehler bei der Verbindung zur Datenbank: {e}")
        return None

def execute_query(connection, query):
    """
    Führt eine SQL-Abfrage aus.

    :param connection: Die Datenbankverbindung.
    :param query: Die auszuführende SQL-Abfrage.
    :return: Die Ergebnisse der Abfrage.
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(query)
            results = cursor.fetchall()
            connection.commit()
            return results
    except pymysql.MySQLError as e:
        print(f"Fehler bei der Ausführung der Abfrage: {e}")
        return None

def close_connection(connection):
    """
    Schließt die Datenbankverbindung.

    :param connection: Die zu schließende Verbindung.
    """
    try:
        connection.close()
        print("Verbindung zur Datenbank geschlossen.")
    except pymysql.MySQLError as e:
        print(f"Fehler beim Schließen der Verbindung: {e}")

if __name__ == "__main__":
    # Verbindungsdetails
    host = 'sem-3-db-instance.c0sfngnwa7zb.eu-central-2.rds.amazonaws.com'  # Ersetzen Sie dies durch den tatsächlichen Endpunkt Ihrer RDS-Instanz
    user = 'admin'
    password = 'mypassword'
    database = 'sem-3-db-instance'  # Ersetzen Sie dies durch den tatsächlichen Datenbanknamen

    # Verbindung zur RDS-Instanz herstellen
    connection = connect_to_rds(host, user, password, database)

    if connection:
        # Beispiel-SQL-Abfrage
        query = "SHOW TABLES;"
        results = execute_query(connection, query)
        if results is not None:
            for row in results:
                print(row)

        # Schließen der Verbindung
        close_connection(connection)

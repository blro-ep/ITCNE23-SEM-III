-- Statuscode Tabelle
CREATE TABLE statuscode (
  id_statuscode INT PRIMARY KEY AUTO_INCREMENT,
  code_type INT,
  code_bezeichnung VARCHAR(45)
);

-- Benutzer Tabelle
CREATE TABLE benutzer (
  id_benutzer INT PRIMARY KEY AUTO_INCREMENT,
  ref_status INT,
  unsername VARCHAR(45),
  name VARCHAR(45),
  vorname VARCHAR(45),
  FOREIGN KEY (ref_status) REFERENCES statuscode(id_statuscode)
);

-- Kunde Tabelle
CREATE TABLE kunde (
  id_kunde INT PRIMARY KEY AUTO_INCREMENT,
  ref_status INT,
  kundennummer INT,
  name VARCHAR(45),
  rechnungsadresse VARCHAR(45),
  FOREIGN KEY (ref_status) REFERENCES statuscode(id_statuscode)
);

-- Lieferschein Tabelle (Faktentabelle)
CREATE TABLE lieferschein (
  id_lieferschein INT PRIMARY KEY AUTO_INCREMENT,
  ref_benutzer INT,
  ref_kunde INT,
  ref_status INT,
  lieferadresse VARCHAR(45),
  bestell_datum DATETIME,
  liefer_datum DATE,
  FOREIGN KEY (ref_benutzer) REFERENCES benutzer(id_benutzer),
  FOREIGN KEY (ref_kunde) REFERENCES kunde(id_kunde),
  FOREIGN KEY (ref_status) REFERENCES statuscode(id_statuscode)
);

# Project 3 - Batchs Processing

### Target Pencapaian

- Bisa membuat ETL sederhana
- Mengasah skill di sesi2 sebelumnya seperti git, python, database dan docker
- Diharapkan peserta bisa mengikuti sampai script berjalan di device masing - masing karena ini akan menjadi penilaian di sesi 17

### Persiapan Project

Tools yang harus di install:

- Python
- Vscode/pycharm
- Docker
- Postgres SQL (install langsung atau pake docker)
- GUI SQL (Dbeaver, Pgadmin, etc)
- Git
- Sourcetree (Optional)

Requirements:
```
- Python ≥ 3.7
- Packages:
psycopg2-binary==2.9.3
SQLAlchemy==1.4.40
sqlparse==0.4.2
pandas==1.4.3
```
Bahan Project:

- https://drive.google.com/drive/folders/1leg8hIQw6t2qjLxFmKSZcK1XlW5DRIXZ?usp=sharing
- Siapkan Repository di Github (daftar terlebih dahulu jika belum punya akun)
- Docker compose postgres SQL:

```
version: '2'
services:
  postgres-db:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
      - PGDATA=/var/lib/postgresql/data
      - POSTGRES_DB=marketplace_prod
    volumes:
    - postgres_data:/var/lib/postgresql/data
    ports:
    - 5433:5432/tcp
volumes:
    postgres_data:
        external: true
```

### Background Project

Tim data analyst membutuhkan tabel untuk membuat dashboard terkait detail order dari data source yang ada di database production `marketplace`, Anda sebagai data engineer di minta untuk membuat script data migrasi dari tabel source tersebut ke data warehouse, sehingga tim data analyst bisa menggunakan table dari data warehouse tanpa membebankan database production `marketplace`.

Tim data analyst sudah memberikan requirement kolom - kolom apa saja yang dibutuhkan, berikut schema yang dibutuhkan oleh tim data analyst:

```
order_id INT NOT NULL,
order_date DATE NOT NULL,
user_id INT NOT NULL,
payment_name VARCHAR(255),
shipper_name VARCHAR(255),
order_price INT,
order_discount INT,
voucher_name VARCHAR(255),
voucher_price INT,
order_total INT,
rating_status VARCHAR(255)
```

### Goal Project

Membuat tabel di data warehouse dengan schema yang sudah ditentukan oleh user

### Step by Step

1. Open Dbeaver
2. Connect postgresSQL
3. Insert schema & data di data source (script tersedia di bahan drive)
4. Insert schema di data warehouse

```
DROP TABLE IF EXISTS dim_orders;
CREATE TABLE dim_orders (
	order_id INT NOT NULL,
	order_date DATE NOT NULL,
	user_id INT NOT NULL,
	payment_name VARCHAR(255),
	shipper_name VARCHAR(255),
	order_price INT,
	order_discount INT,
	voucher_name VARCHAR(255),
	voucher_price INT,
	order_total INT,
	rating_status VARCHAR(255)
	);
```

5. Open Vscode
6. Create Repository in Github
7. Clone Repository, example:

```
git clone xxxxxxxx
```

8. Config connector
    
    ```sql
    {
        "marketplace_prod": {
            "host": "",
            "db": "",
            "user": "",
            "password": "",
            "port": ""
        },
        "dwh": {
            "host": "",
            "db": "",
            "user": "",
            "password": "",
            "port": ""
        }
    }
    ```
    
9. Connector script data source
10. Connector script data warehouse
11. Main script batch processing
12. Testing
13. Git push
14. Share link repo ke tutor

Tabel Source
![image](https://github.com/axeltanjung/batch_processing/assets/87402782/61c90149-850a-4cf5-9c59-1d6ab22cf0b9)

Table Data Warehouse
![image](https://github.com/axeltanjung/batch_processing/assets/87402782/8c394886-fefd-4d48-a908-d186b58a1d93)

    


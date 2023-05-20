    <?php

    class Database {
        private $host = 'localhost';
        private $username = 'root';
        private $password = 'root';
        private $database = 'documentacao';
        private $connection;

        public function connect() {
            $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);

            if ($this->connection->connect_error) {
                die("Falha na conexão: " . $this->connection->connect_error);
            }
        }

        public function disconnect() {
            $this->connection->close();
        }

        public function query($sql) {
            $result = $this->connection->query($sql);

            if (!$result) {
                die("Erro na consulta: " . $this->connection->error);
            }

            return $result;
        }

        public function escape($value) {
            return $this->connection->real_escape_string($value);
        }
    }

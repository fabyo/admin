<?php

namespace FGO\Console\Commands;

use Illuminate\Console\Command;

class Databade extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:database';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a new database';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
		$host     = env('DB_HOST');
		$database = env('DB_DATABASE');
		$user     = env('DB_USERNAME');
		$pass     = env('DB_PASSWORD');		
		$driver   = config('database.default');		
		$dsn      = "{$driver}:host={$host};";
		
		try {
			$conn = new \PDO($dsn, $user, $pass, [
				\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION
			]);
			$conn->exec('DROP DATABASE IF EXISTS ' . $database);
			$conn->exec("CREATE DATABASE {$database} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;");
			$this->info('Successo!');
		} catch(\PDOException $e) {
			$this->error($e->getMessage());
		}
    }
}

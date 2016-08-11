<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(FGO\User::class, 50)->create();

        FGO\User::create([
            'name'     => 'Fabyo',
            'email'    => 'fabyo.php@gmail.com',
            'password' => bcrypt(123456)
        ]);
    }
}

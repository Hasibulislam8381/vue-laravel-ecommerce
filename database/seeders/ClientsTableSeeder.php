<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Client;

class ClientsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Client::create(['first_name' => 'John', 'last_name' => 'Doe', 'email' => 'john.doe@example.com']);
        // Use the factory to create dummy clients
        Client::factory(10)->create();
    }
}

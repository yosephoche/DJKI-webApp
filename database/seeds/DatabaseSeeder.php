<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsersTableSeeder::class);
        $this->call(AboutTableSeeder::class);
        $this->call(SettingTableSeeder::class);
    }
}

class UsersTableSeeder Extends Seeder
{
	public function run()
	{
		App\User::truncate();

		$data = [
			[
				'fullname'	=> 'Super Admin',
				'username'	=> 'super_admin',
				'email'		=> 'superadmin@mail.com',
				'status'	=> 'Super Admin',
				'image'		=> '111111.png',
				'password'	=> bcrypt('admin')
			],
			[
				'fullname'	=> 'Admin',
				'username'	=> 'admin',
				'email' 	=> 'admin@mail.com',
				'status'	=> 'Admin',
				'image'		=> '111111.png',
				'password'	=> bcrypt('admin')
			]
		];

		DB::table('users')->insert($data);
	}

}

class AboutTableSeeder Extends Seeder
{
	public function run()
	{
		$data = [
			[
				'about'		=> 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit dicta eveniet voluptatem laboriosam sequi illo ducimus, itaque, veritatis, eos suscipit voluptate! Hic, laborum eligendi perspiciatis, quidem ipsa placeat deleniti odio distinctio tempore. Quaerat, non deserunt quisquam iure dolores, fugiat quos sint dolore quod, perferendis deleniti suscipit dicta facere temporibus in.',
				'founded'	=> date("Y-m-d"),
				'industry'	=> 'Software',
				'vision'	=> 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum quasi illo inventore veniam ipsa velit doloremque optio a dolorem qui, ad esse perspiciatis vitae deserunt doloribus facere officiis minus reiciendis!',
				'mission'	=> 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum quasi illo inventore veniam ipsa velit doloremque optio a dolorem qui, ad esse perspiciatis vitae deserunt doloribus facere officiis minus reiciendis!',
				'maps'		=> '',
				'image'		=> ''
			]
		];

		DB::table('pages_about')->insert($data);
	}

}

class SettingTableSeeder Extends Seeder
{
	public function run()
	{
		$now = new DateTime();
		$end = $now->modify('+1 years');

		$data = [
			'meta_title'		=> 'Your Website',
			'meta_description'	=> 'Explain about this website',
			'meta_keyword'		=> '',
			'timezone'			=> 'Asia/Makassar',
			'email'				=> '',
			'phone'				=> '',
			'address'			=> '',
			'maintenance'		=> '1',
			'logo'				=> '',
			'favicon'			=> '',
			'og_image'			=> '',
			'facebook'			=> '',
			'twitter'			=> '',
			'google'			=> '',
			'linkedin'			=> '',
			'youtube'			=> '',
			'instagram'			=> '',
			'expired_at'		=> $end
		];

		DB::table('setting')->insert($data);
	}

}

<?php

namespace App\Helpers;

// use Request;
// use Cloudder;

class GeneralHelper
{
	// public function stringToObjectId($id) {
	// 	$objId = new \MongoDB\BSON\ObjectId($id);
	// 	return $objId;
	// }

	// function generateIsoDate($date) {
	// 	return new \MongoDB\BSON\UTCDateTime(new \DateTime($date));
	// }

	// public function codeRandom($length) {
	// 	$data = 'ABCDEFGHIJKLMNOPQRSTU1234567890';
	// 	$string = '';
	// 	for($i = 0; $i < $length; $i++) {
	// 		$pos = rand(0, strlen($data)-1);
	// 		$string .= $data{$pos};
	// 	}
	// 	return $string;
	// }

	// public function uploadCloudinary($image) {
	// 	$randomName = time();
	// 	$path = 'sidowi-users/'.$randomName;
	// 	$cloudder = Cloudder::upload($image->getRealPath(), $path);
	// 	$uploadResult = $cloudder->getResult();
	// 	$file_url = $uploadResult["secure_url"];

	// 	return $file_url;
	// }

	// public function formatNumberPhone($number) {
	// 	// kadang ada penulisan no hp 0811 239 345
	// 	$number = str_replace(" ","",$number);
	// 	// kadang ada penulisan no hp (0274) 778787
	// 	$number = str_replace("(","",$number);
	// 	// kadang ada penulisan no hp (0274) 778787
	// 	$number = str_replace(")","",$number);
	// 	// kadang ada penulisan no hp 0811.239.345
	// 	$number = str_replace(".","",$number);

	// 	// cek apakah no hp mengandung karakter + dan 0-9
	// 	if(!preg_match('/[^+0-9]/',trim($number))){
	// 		// cek apakah no hp karakter 1-3 adalah +62
	// 		if(substr(trim($number), 0, 3)=='+62'){
	// 			$numberPhone = trim($number);
	// 		}
	// 		// cek apakah no hp karakter 1 adalah 0
	// 		elseif(substr(trim($number), 0, 1)=='0'){
	// 			$numberPhone = '+62'.substr(trim($number), 1);
	// 		}
	// 	}
	// 	return $numberPhone;
	// }

	public function RegisterValidationMessageCustom()
	{
		$customMessages = [
			'required' => 'Mohon di isi',
			// 'date' => 'Isian :attribute bukan tanggal yang valid',
			'string' => 'Isian harus berupa string',
			'name.max' => 'nama tidak boleh lebih dari 20 karakter',
			'id_posts.integer' => 'id posts harus berupa bilangan bulat',
			// 'email.email' => 'Email tidak valid',
			// 'phone.unique' => 'Nomor telepon ini telah terdaftar sebelumnya',
			// 'max' => [
			// 	'numeric' => 'Isian :attribute seharusnya tidak lebih dari :max',
			// 	'file' => 'Isian :attribute seharusnya tidak lebih dari :max kilobytes',
			// 	'string' => 'Isian :attribute seharusnya tidak lebih dari :max karakter',
			// 	'array' => 'Isian :attribute seharusnya tidak lebih dari :max item',
			// ],
			// 'min' => [
			// 	'numeric' => 'Isian :attribute harus minimal :min',
			// 	'file' => 'Isian :attribute harus minimal :min kilobytes',
			// 	'string' => 'Isian :attribute harus minimal :min karakter',
			// 	'array' => 'Isian :attribute harus minimal :min item',
			// ],
		];

		return  $customMessages;
	}
}

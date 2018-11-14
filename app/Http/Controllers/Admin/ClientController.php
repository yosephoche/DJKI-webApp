<?php

namespace App\Http\Controllers\Admin;
use App\Client;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use GlobalClass, DB;

class ClientController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

    public function index()
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);
			$data['client'] = Client::all();
    	return view('admin.client.index', $data);
    }

    public function create()
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);
    	return view('admin.client.create');
    }

    public function store(Request $r)
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);

    	/*Validation Store*/
			$this->validate($r,[
				'name'=>'required',
				'image'=>'required'
			]);

			$client = new Client();

			/*Save DB*/
			$client->name = $r->name;
			$client->message = $r->message;
			$client->image = $r->image;
			$client->save();

			/*Success Message*/
			$r->session()->flash('success', 'Client Successfully Added');
			return redirect(route('client'));
    }

    public function edit($id)
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);
			try
			{
		    $client = Client::findOrFail($id);
				$data['client'] = $client;
				return view('admin.client.edit', $data);
			}
			catch(ModelNotFoundException $e)
			{
		    return redirect()->route('client');
			}
    }

    public function update($id, Request $r)
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);

    	/*Validation Update*/
			$this->validate($r,[
				'name'=>'required',
				'image'=>'required'
			]);

			$client = Client::find($id);

			/*Save to DB*/
			$client->image = $r->image;
			$client->name = $r->name;
			$client->message = $r->message;
			$client->save();

			/*Success Message*/
			$r->session()->flash('success', 'Client Successfully Modified');
			return redirect(route('client'));
    }

    public function delete(Request $r)
    {
    	GlobalClass::Roleback(['Customer Service', 'Writer']);

    	/*Delete Data*/
			Client::where('id', $r->id)->delete();

			/*Success Message*/
			$r->session()->flash('success', 'Client Successfully Deleted');
			return redirect(route('client'));
    }
}

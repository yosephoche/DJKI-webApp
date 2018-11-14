<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Archive;
use DB;
use TemplateModule;

class CustomizerController extends Controller
{
  public function get(Request $r) {
    switch ($r->get) {
      case 'chat':
        $result['response'] = $this->getChat();
        $result['diagnostic'] = [
          'code'=>200,
          'status'=>'ok'
        ];
        return response($result, 200);
        break;
      case 'direktur':
        $result['response'] = $this->direktur();
        $result['diagnostic'] = [
          'code'=>200,
          'status'=>'ok'
        ];
        return response($result, 200);
        break;
      default:
        return response([
          'diagnostic' => [
            'status'=>'NOT_FOUND',
            'code'=>404
          ]
        ], 404);
      break;
    }
  }

  public function getChat() {
    return [
      'target'=>$this->customizer(['type'=>'text','id'=>'widget_chat'])
    ];
  }

  public function direktur() {
    return json_decode(json_encode($this->customizer(['type'=>'repeater','id'=>'direktur'])), true)[1];
  }

  public function customizer($param = array()) {
    $type = $param['type'];
    $id = $param['id'];
    return TemplateModule::setupTheme()['setup']->widget->$type->$id;
  }
}

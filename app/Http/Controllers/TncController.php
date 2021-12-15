<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Cart;
use App\Models\Address;
use App\Models\Order;
class TncController extends Controller
{
   
    public function index(){
         return view('front.index');
    }
    
    public static function report_key($val,$rep=null){
         $success_data = array('status'=>200,'success'=>true,'message'=>''.$rep.' registration successful','path'=>'/api/'.$rep.'');
         $empty_data   = array('status'=>300,'error'=>'Array Values Do Not Match','message'=>'Post is Missing or Incorrect','path'=>'/api/'.$rep.'');
         $missing_data = array('status'=>400,'error'=>'Missing Parameter','message'=>'Fill in the required fields','path'=>'/api/'.$rep.'');
         $ar_data      = array('status'=>500,'error'=>'Invalid Data Format','message'=>'There is an error in your json format','path'=>'/api/'.$rep.'');
         switch($val){
             case 200:
                return $success_data;
                break;
             case 300:
                return $empty_data;
                break;
             case 400:
                return $missing_data;
                break;
             case 500:
                return $ar_data;
                break;
         }
     }
     public function key_control($key,$section=null){
        $final_data=array();
        if(empty($key)):
            return $this::report_key(500,$section);   
            exit;
        endif;
        switch($section){
            case 'customer':
               $final_data=array('customer_code'=>'0','user_name'=>'0','email'=>'0','password'=>'0');
               if($key['customer_code']!=""):
                 $ins_data=Customer::insert($key);
               else:
                  return $this::report_key(400,$section);
               endif;
               break;
            case 'address':
               $final_data=array('address_code'=>'0','customer_code'=>'0','address'=>'0');
               if($key['customer_code']!=""):
                 $ins_data=Address::insert($key);
               else:
                  return $this::report_key(400,$section);
               endif;  
               break;
            case 'cart':
               $final_data=array('cart_code'=>'0','customer_code'=>'0','product_code'=>'0','quantity'=>'0','price'=>'0');
               if($key['customer_code']!="" and $key['cart_code']!=""):
                 $ins_data=Cart::insert($key);
               else:
                  return $this::report_key(400,$section);
               endif; 
               break;
            case 'order':
               $final_data=array('order_code'=>'0','cart_code'=>'0','total_price'=>'0','confirm_status'=>'0','status'=>'0','is_deleted'=>'0','shipping_address_code'=>'0');
               if($key['order_code']!="" and $key['cart_code']!=""):
                 $ins_data=Order::insert($key);
               else:
                  return $this::report_key(400,$section);
               endif; 
               break;
        }
        $control_res=array_diff_key($final_data,$key);
        $C_=array_keys($control_res);
        if(empty($C_)):
            if($ins_data):
             return $this::report_key(200,$section);   
            endif;
        else:
             return $this::report_key(300,$section);
        endif;
     }
   
     public function customer(Request $request){
        $rest=$request->getContent();
        $new=json_decode($rest,true);
        return $this->key_control($new,'customer');
     }

     public function address(Request $request){
        $rest=$request->getContent();
        $new=json_decode($rest,true);
        return $this->key_control($new,'address');
     }

     public function cart(Request $request){
        $rest=$request->getContent();
        $new=json_decode($rest,true);
        return $this->key_control($new,'cart');
     }

     public function order(Request $request){
        $rest=$request->getContent();
        $new=json_decode($rest,true);
        return $this->key_control($new,'order');
     }

     
}

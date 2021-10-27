<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TaskRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            // 'title' => 'required',
            'project_id' => 'required|exists:projects,id',
            'who_is_assign' => 'required|exists:users,id',
            'description' => 'required',
            'hours' => 'required|integer|min:0',
            'minutes' => 'required|integer|min:0|max:59',
        ];
    }
    public function messages()
    {
        return [
            'required'=> "Sorry, this field cannot be empty !!",
            'hours.required' => 'One of time field is required',
            'minutes.required' => 'One of time field is required',
            'who_is_assign.exists'=>"Choose Person Name",
            'project_id.exists'=>"Choose Project Name",
            'min'=>'the minimum number is: 0',
            'max'=> 'the maximun number is 59'
        ];
    }
}

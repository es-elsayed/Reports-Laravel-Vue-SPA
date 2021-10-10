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
            'title' => 'required',
            'project_name' => 'required|exists:projects,title',
            'report_id' => 'required|exists:reports,id',
            'who_is_assign' => 'required|exists:users,name',
            // 'role' => 'required|exists:users,role',
            // 'current_date' => 'required|date',
            // 'hours' => 'required|integer|min:0',
            // 'minutes' => 'required|integer|min:0|max:59',
            // 'user_id' => 'required|exists:users,id',
        ];
    }
    public function messages()
    {
        return [
            'required'=> "this field is required",
            'date'=>'invalid date',
            'exists'=>'invalid Input data',
            'min'=>'the minimum number is: 0',
            'max'=> 'the maximun number is 59'
        ];
    }
}

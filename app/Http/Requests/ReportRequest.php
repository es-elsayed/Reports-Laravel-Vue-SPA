<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReportRequest extends FormRequest
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
            'title' => 'required|string|max:255|min:3',
            'current_date' => 'required|date',
            'user_id' => 'required|exists:users,id',
        ];
    }
    public function messages()
    {
        return [
            'required' => 'This field is required',
            'string' => 'This field must be string',
            'max' => 'Maximum character must be less than 256',
            'min' => 'min character must be greater than 3',
            'exists' => 'Invalid user id',
        ];
    }
}

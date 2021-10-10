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
            'title' => 'required|string|min:5|max:255|in:1',
        ];
    }
    public function messages()
    {
        return [
            'title.required' => 'The Title is required',
            'title.string' => 'This title must be string',
            'title.min' => 'The minimun character is 5',
            'title.max' => 'The maximum character is 255',
            'title.in' => 'Sorry!.., You can\'t acess this report',
        ];
    }
}

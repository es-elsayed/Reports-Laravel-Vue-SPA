<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ReportRequest;
use App\Http\Requests\TaskRequest;
use App\Http\Resources\TaskResource;
use App\Models\Report;
use App\Models\Task;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return '$request->id';
        $tasks = Task::orderBy('created_at', 'DESC')->paginate(10);
        return TaskResource::collection($tasks);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TaskRequest $request)
    {
        if ($request->report_id == null) {
            $lastReport = Report::where('status', '1')->get();
            if (sizeof($lastReport) == 1) {
                $lastReportId = $lastReport[0]->id;
                $task =  Task::create([
                    'title' => $request->title,
                    'project_id' => $request->project_id,
                    'report_id' => $lastReportId,
                    'who_is_assign' => $request->who_is_assign,
                    'description' => $request->description,
                    'hours' => $request->hours,
                    'minutes' => $request->minutes,
                    'user_id' => $request->user_id,
                ]);
                return new TaskResource($task);
            } else {
                return 'ReportId cannot be null, please try again later';
            }
        };
        try {
            $task =  Task::create([
                'title' => $request->title,
                'project_id' => $request->project_id,
                'report_id' => $request->report_id,
                'who_is_assign' => $request->who_is_assign,
                'description' => $request->description,
                'hours' => $request->hours,
                'minutes' => $request->minutes,
                'user_id' => $request->user_id,
            ]);
            return new TaskResource($task);
        } catch (\Exception $ex) {
            return $ex;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // return 'hi';
        $tasks = Task::where('project_id', $id)->orderBy('created_at', 'DESC')->paginate(10);
        return TaskResource::collection($tasks);
    }
    public function users($id)
    {
        // return 'hi';
        $tasks = Task::where('user_id', $id)->orderBy('created_at', 'DESC')->paginate(10);
        return TaskResource::collection($tasks);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

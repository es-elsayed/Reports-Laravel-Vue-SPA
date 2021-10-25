import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  tasks: null,
  task: null
}

// getters
export const getters = {
  all: state => state.tasks,
  show: state => state.task
}

// mutations
export const mutations = {
  [types.FETCH_TASKS] (state, { tasks }) {
    state.tasks = tasks.data
  },
  [types.FETCH_TASK] (state, { task }) {
    state.task = task.data
    console.log(task);
  }
}

// actions
export const actions = {
  async fetchTasks ({ commit }) {
    try {
      const { data } = await axios.get('/api/tasks')

      commit(types.FETCH_TASKS, { tasks: data })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchUserTasks ({ commit }, { id }) {
    try {
      const { data } = await axios.get(`/api/reports/tasks/user/${id}`)
      commit(types.FETCH_TASK, { task: data })
    } catch (e) {
      console.log(e)
    }
  }
}

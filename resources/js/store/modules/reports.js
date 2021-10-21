import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  reports: null,
  report: null
}

// getters
export const getters = {
  all: state => state.reports,
  show: state => state.report
}

// mutations
export const mutations = {
  [types.FETCH_REPORTS] (state, { reports }) {
    state.reports = reports
  },
  [types.FETCH_REPORT] (state, { report }) {
    state.report = report
  }
}

// actions
export const actions = {
  async fetchJobs ({ commit }) {
    try {
      const { data } = await axios.get('/api/jobs')

      commit(types.FETCH_REPORTS, { jobs: data.data })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchJob ({ commit }, { id }) {
    try {
      const { data } = await axios.get(`/api/jobs/${id}`)

      commit(types.FETCH_REPORT, { job: data.data })
    } catch (e) {
      console.log(e)
    }
  }
}

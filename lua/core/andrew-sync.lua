-- Setup syncing between CMU servers and local
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = "/Users/jasperdavidson/code/school/15122/**",
	callback = function()
		local local_file = vim.fn.expand '%:p'
    		local local_base = 'Users/jasperdavidson/code/school/15122/'
    		local remote_host = 'jjdavids@linux.andrew.cmu.edu'
    		local remote_base = '/afs/andrew.cmu.edu/usr/jjdavids/private/15122/'
			
    		local relative_path = local_file:sub(#local_base + 1)
    		local remote_path = remote_base .. relative_path

	    -- Use jobstart to run in background (async)
	    vim.fn.jobstart({ 'rsync', '-az', local_file, remote_host .. ':' .. remote_path }, {
	      on_exit = function(job_id, exit_code, event_type)
		if exit_code == 0 then
		  print 'Synced to Andrew!'
		else
		  print 'Sync FAILED: Check your SSH Master connection'
		end
	      end,
	    })
	end
})

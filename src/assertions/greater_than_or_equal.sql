create or replace function assert.GreaterThanOrEqual(_expected anyelement, _actual anyelement, _description text default '') returns boolean as $$
    declare
        _context text;
    begin

        GET DIAGNOSTICS _context = PG_CONTEXT;

        IF _actual >= _expected THEN
            return true;
        END IF;

        return assert.Fail(format('Failed asserting that %s is equal to %s or is greater than %s.', _actual, _expected, _expected), _description, _context);
    end;
$$ language plpgsql;
